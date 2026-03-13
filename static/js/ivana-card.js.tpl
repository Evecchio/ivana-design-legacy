function normalizeIvanaProductCardDiscounts(root) {
    var scope = root || document;
    var priceContainers = scope.querySelectorAll('.js-product-item-private.product-item.ivana-card .product-item-price-container');

    priceContainers.forEach(function(container) {
        var discountBadge = container.querySelector('.product-item-discount');
        var comparePrice = container.querySelector('span.js-compare-price-display.product-item-price-compare');

        if (!discountBadge) {
            container.classList.add('ivana-no-discount');
            return;
        }

        var discountText = (discountBadge.textContent || '').replace(/\s+/g, ' ').trim();
        var discountMatch = discountText.match(/\d+(?:[.,]\d+)?/);
        var discountValue = discountMatch ? parseFloat(discountMatch[0].replace(',', '.')) : null;
        var hideDiscount = discountValue === 0;

        if (hideDiscount) {
            discountBadge.style.display = 'none';

            if (comparePrice) {
                comparePrice.style.display = 'none';
            }

            container.classList.add('ivana-no-discount');
            return;
        }

        discountBadge.style.display = '';

        if (comparePrice) {
            comparePrice.style.display = '';
        }

        container.classList.remove('ivana-no-discount');
    });
}

var ivanaProductCardDiscountsQueued = false;

function queueIvanaProductCardDiscountNormalization() {
    if (ivanaProductCardDiscountsQueued) {
        return;
    }

    ivanaProductCardDiscountsQueued = true;

    window.requestAnimationFrame(function() {
        normalizeIvanaProductCardDiscounts(document);
        ivanaProductCardDiscountsQueued = false;
    });
}

queueIvanaProductCardDiscountNormalization();

if (!window.ivanaProductCardDiscountObserver) {
    window.ivanaProductCardDiscountObserver = new MutationObserver(function() {
        queueIvanaProductCardDiscountNormalization();
    });

    window.ivanaProductCardDiscountObserver.observe(document.body, {
        childList: true,
        subtree: true
    });
}
