function parseIvanaMoneyValue(text) {
    if (!text) {
        return null;
    }

    var normalized = String(text).replace(/\s+/g, "").replace(/[^\d,.-]/g, "");

    if (!normalized) {
        return null;
    }

    if (normalized.indexOf(",") > -1 && normalized.indexOf(".") > -1) {
        normalized = normalized.replace(/\./g, "").replace(",", ".");
    } else if (normalized.indexOf(",") > -1) {
        normalized = normalized.replace(",", ".");
    } else if (normalized.indexOf(".") > -1) {
        if (/\.\d{3}$/.test(normalized) && !/\.\d{1,2}$/.test(normalized.replace(/\.\d{3}/g, ""))) {
            normalized = normalized.replace(/\./g, "");
        }
    }

    var value = parseFloat(normalized);

    return isNaN(value) ? null : value;
}

function normalizeIvanaProductCards(root) {
    var scope = root || document;
    var cards = scope.querySelectorAll(".js-product-item-private.product-item.ivana-card, .js-item-product, .js-product-container.js-product-item");

    cards.forEach(function(card) {
        // Normalizar nombre: solo primera letra mayúscula
        var nameEl = card.querySelector(".js-item-name");
        if (nameEl && !nameEl.dataset.ivanaNameNormalized) {
            var rawText = nameEl.textContent.trim();
            if (rawText) {
                nameEl.textContent = rawText.charAt(0).toUpperCase() + rawText.slice(1).toLowerCase();
                nameEl.dataset.ivanaNameNormalized = "1";
            }
        }

        var priceContainer = card.querySelector(".product-item-price-container");
        var discountBadge = card.querySelector(".product-item-discount");
        var comparePrice = card.querySelector("span.js-compare-price-display.product-item-price-compare");
        var currentPrice = card.querySelector("span.js-price-display.product-item-price");

        if (!priceContainer) {
            return;
        }

        var currentPriceValue = currentPrice ? parseIvanaMoneyValue(currentPrice.textContent) : null;
        var comparePriceValue = comparePrice ? parseIvanaMoneyValue(comparePrice.textContent) : null;
        var discountValue = null;

        if (discountBadge) {
            var discountText = (discountBadge.textContent || "").replace(/\s+/g, " ").trim();
            var discountMatch = discountText.match(/\d+(?:[.,]\d+)?/);
            discountValue = discountMatch ? parseFloat(discountMatch[0].replace(",", ".")) : null;
        }

        var hideDiscount = !discountBadge || discountValue === null || discountValue <= 0;
        var hideComparePrice = !comparePrice || comparePriceValue === null || currentPriceValue === null || comparePriceValue <= currentPriceValue;

        if (discountBadge) {
            discountBadge.style.display = hideDiscount ? "none" : "";
        }

        if (comparePrice) {
            comparePrice.style.display = (hideDiscount || hideComparePrice) ? "none" : "";
        }

        priceContainer.classList.toggle("ivana-no-discount", hideDiscount || hideComparePrice);
        card.classList.toggle("ivana-no-discount", hideDiscount || hideComparePrice);

        // Wrap current price + discount badge in a single row container
        if (currentPrice && discountBadge && !card.querySelector(".ivana-price-row")) {
            var priceRow = document.createElement("span");
            priceRow.className = "ivana-price-row";
            currentPrice.parentNode.insertBefore(priceRow, currentPrice);
            priceRow.appendChild(currentPrice);
            priceRow.appendChild(discountBadge);
        }

        card.querySelectorAll(".custom-installments, .text-accent").forEach(function(node) {
            if (!node.textContent || !node.textContent.trim()) {
                node.style.display = "none";
            }
        });

        // Move installments block right after price container
        var installmentsContainer = card.querySelector(".js-max-installments-container");
        if (installmentsContainer && priceContainer && priceContainer.parentNode) {
            priceContainer.parentNode.insertBefore(installmentsContainer, priceContainer.nextSibling);
        }

        var paymentDiscountContainer = card.querySelector(".js-ivana-card-payment-discount, .js-payment-discount-price-product-container");
        if (paymentDiscountContainer && installmentsContainer && installmentsContainer.parentNode) {
            installmentsContainer.parentNode.insertBefore(paymentDiscountContainer, installmentsContainer.nextSibling);
        } else if (paymentDiscountContainer && priceContainer && priceContainer.parentNode) {
            priceContainer.parentNode.insertBefore(paymentDiscountContainer, priceContainer.nextSibling);
        }

        var commercialAnchor = paymentDiscountContainer || installmentsContainer || priceContainer;

        // Ubicar badges de estado justo después del bloque comercial
        var lowStockBadge = card.querySelector(".ivana-low-stock-badge");
        if (lowStockBadge && commercialAnchor && commercialAnchor.parentNode) {
            commercialAnchor.parentNode.insertBefore(lowStockBadge, commercialAnchor.nextSibling);
        } else if (lowStockBadge && priceContainer && priceContainer.parentNode) {
            priceContainer.parentNode.insertBefore(lowStockBadge, priceContainer.nextSibling);
        }

        var outOfStockBadge = card.querySelector(".ivana-out-of-stock-badge");
        if (outOfStockBadge && commercialAnchor && commercialAnchor.parentNode) {
            commercialAnchor.parentNode.insertBefore(outOfStockBadge, commercialAnchor.nextSibling);
        } else if (outOfStockBadge && priceContainer && priceContainer.parentNode) {
            priceContainer.parentNode.insertBefore(outOfStockBadge, priceContainer.nextSibling);
        }

        // Create "Ahorras" savings badge — barra full-width ENTRE imagen e info
        var existingBadge = card.querySelector(".ivana-savings-badge");
        if (!hideComparePrice && !hideDiscount && comparePriceValue && currentPriceValue && comparePriceValue > currentPriceValue) {
            var savings = comparePriceValue - currentPriceValue;
            var priceText = (currentPrice.textContent || "").trim();
            var currencySymbol = priceText.replace(/[\d.,\s]/g, "") || "$";
            var usesDotThousands = /\d\.\d{3}/.test(priceText);
            var usesCommaThousands = /\d,\d{3}/.test(priceText);
            var savingsRound = Math.round(savings);
            var savingsStr = savingsRound.toString();
            if (usesDotThousands) {
                savingsStr = savingsStr.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            } else if (usesCommaThousands) {
                savingsStr = savingsStr.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            var formattedSavings = currencySymbol + savingsStr;
            if (!existingBadge) {
                existingBadge = document.createElement("div");
                existingBadge.className = "ivana-savings-badge";
                // Icono de etiqueta SVG
                var tagIcon = '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2H2v10l9.29 9.29c.94.94 2.48.94 3.42 0l6.58-6.58c.94-.94.94-2.48 0-3.42L12 2Z"/><path d="M7 7h.01"/></svg>';
                existingBadge.innerHTML = '<span class="ivana-savings-text"></span> ' + tagIcon;
            }
            existingBadge.querySelector(".ivana-savings-text").textContent = "Ahorr\u00e1s " + formattedSavings;
            existingBadge.style.display = "";
            // Insertar ENTRE la imagen y el contenedor de info
            var infoContainer = card.querySelector(".ivana-card-info") || card.querySelector(".product-item-information") || card.querySelector(".information");
            if (infoContainer && existingBadge.parentNode !== card) {
                card.insertBefore(existingBadge, infoContainer);
            }
        } else if (existingBadge) {
            existingBadge.style.display = "none";
        }
    });
}

var ivanaProductCardsQueued = false;

function updateIvanaHomeCategoryCarouselOverflow(slider) {
    if (!slider) {
        return;
    }

    var isOverflowing = slider.scrollWidth > (slider.clientWidth + 1);
    slider.classList.toggle("ivana-overflowing", isOverflowing);
}

function initializeIvanaHomeCategoryCarouselMouseScroll() {
    var sliders = document.querySelectorAll(".ivana-home-categories-row.category-slider-mobile");

    sliders.forEach(function(slider) {
        updateIvanaHomeCategoryCarouselOverflow(slider);

        if (slider.dataset.ivanaMouseScrollBound === "1") {
            return;
        }

        slider.dataset.ivanaMouseScrollBound = "1";

        slider.addEventListener("wheel", function(event) {
            if (window.innerWidth < 768) {
                return;
            }

            var delta = Math.abs(event.deltaX) > Math.abs(event.deltaY) ? event.deltaX : event.deltaY;

            if (!delta) {
                return;
            }

            event.preventDefault();
            slider.scrollLeft += delta;
        }, { passive: false });
    });

    if (!window.ivanaHomeCategoryOverflowResizeBound) {
        window.ivanaHomeCategoryOverflowResizeBound = true;

        window.addEventListener("resize", function() {
            document.querySelectorAll(".ivana-home-categories-row.category-slider-mobile").forEach(function(slider) {
                updateIvanaHomeCategoryCarouselOverflow(slider);
            });
        });
    }
}

function queueIvanaProductCardNormalization() {
    if (ivanaProductCardsQueued) {
        return;
    }

    ivanaProductCardsQueued = true;

    window.requestAnimationFrame(function() {
        normalizeIvanaProductCards(document);
        initializeIvanaHomeCategoryCarouselMouseScroll();
        ivanaProductCardsQueued = false;
    });
}

queueIvanaProductCardNormalization();

if (!window.ivanaProductCardObserver) {
    window.ivanaProductCardObserver = new MutationObserver(function() {
        queueIvanaProductCardNormalization();
    });

    window.ivanaProductCardObserver.observe(document.body, {
        childList: true,
        subtree: true
    });
}
