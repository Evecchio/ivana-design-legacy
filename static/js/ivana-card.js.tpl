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
        normalized = normalized.replace(/\./g, "").replace(",", ".");
    } else {
        normalized = normalized.replace(/,/g, "");
    }

    var value = parseFloat(normalized);

    return isNaN(value) ? null : value;
}

function normalizeIvanaProductCards(root) {
    var scope = root || document;
    var cards = scope.querySelectorAll(".js-product-item-private.product-item.ivana-card");

    cards.forEach(function(card) {
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
    });
}

var ivanaProductCardsQueued = false;

function queueIvanaProductCardNormalization() {
    if (ivanaProductCardsQueued) {
        return;
    }

    ivanaProductCardsQueued = true;

    window.requestAnimationFrame(function() {
        normalizeIvanaProductCards(document);
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
