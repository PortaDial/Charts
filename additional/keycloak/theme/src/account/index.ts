import './style.scss';

function setTime() {
    const afterTime = document.getElementById('afterTime');
    if (afterTime) {
        afterTime.textContent = getTimeType();
    }
    const greetingsMessage = document.getElementById('greetingsMessage');
    if (greetingsMessage) {
        greetingsMessage.style.display = 'inherit';
    }
}

export function getTimeType() {
    const today = new Date();
    const curHr = today.getHours();

    if (curHr < 12) {
        return 'morning';
    } else if (curHr < 18) {
        return 'afternoon';
    } else {
        return 'evening';
    }
}

window.addEventListener('load', () => {
    setTime();

    const sideNavigation = document.getElementById('sideNavigation');

    if (sideNavigation) {
        const mediaQueryList = window.matchMedia('(max-width: 66rem)');

        const initToggle = () => {
            if (mediaQueryList.matches) {
                sideNavigation.classList.remove('bx--side-nav--expanded');
            } else {
                sideNavigation.classList.add('bx--side-nav--expanded');
            }
        };

        initToggle();

        mediaQueryList.addEventListener('change', () => {
            initToggle();
        });
    }
});

function toggleMenu(isOpen = false) {
    const sideNavigation = document.getElementById('sideNavigation');
    if (sideNavigation) {
        if (sideNavigation.classList.contains('bx--side-nav--expanded') && isOpen !== true) {
            sideNavigation.classList.remove('bx--side-nav--expanded');
        } else {
            sideNavigation.classList.add('bx--side-nav--expanded');
        }
    }
}

window['toggleMenu'] = toggleMenu;
