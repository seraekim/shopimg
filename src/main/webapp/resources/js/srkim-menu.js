(function (window) {
    'use strict';

    function srkimMenu(el) {
        this.$el = $('#' + el);
        this._init();
    }

    srkimMenu.prototype = {
        _init: function () {
            this.trigger = this.$el.find('a.srkim-icon-menu');
            this.menu = this.$el.find('nav.srkim-menu-wrapper');
            this.isMenuOpen = false;
            this._initEvents();

            this.bodyClickFn = function () {
                this._closeMenu();
            };
        },
        _initEvents: function () {
            var self = this;
            /*this.trigger
                .on('mouseover', function (ev) {
                    self._openIconMenu();
                })
                .on('mouseout', function (ev) {
                    self._closeIconMenu();
                })
                .on('click', function (ev) {

                });*/

            /*this.menu
                .on('mouseover', function (ev) {
                    self._openMenu();
                }).on('mouseout', function (ev) {
                    self._closeMenu();
                });*/

            $(document).on('mousemove', function (e) {
                if(e.pageX <= 60) {
                    self._openIconMenu();
                } else {
                    self._closeIconMenu();
                }
                //console.log("pageX: " + e.pageX + ", pageY: " + e.pageY);
            });

        },
        _openIconMenu: function () {
            this.menu.addClass('srkim-open-part');
        },
        _closeIconMenu: function () {
            this.menu.removeClass('srkim-open-part');
        },
        _openMenu: function () {
            if (this.isMenuOpen) return;
            this.trigger.addClass('srkim-selected');
            this.isMenuOpen = true;
            this.menu.addClass('srkim-open-all');
            this._closeIconMenu();
        },
        _closeMenu: function () {
            if (!this.isMenuOpen) return;
            this.trigger.removeClass('srkim-selected');
            this.isMenuOpen = false;
            this.menu.removeClass('srkim-open-all');
            this._closeIconMenu();
        }
    }

    new srkimMenu('srkim-menu');

})(window);
