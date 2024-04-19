enum Menu {rumahsakit, puskesmas, klinik, apotek}

class MenuService{
  Menu menu;

  MenuService({required this.menu});
}

List<MenuService> services = [
  MenuService(menu: Menu.rumahsakit),
  MenuService(menu: Menu.puskesmas),
  MenuService(menu: Menu.klinik),
  MenuService(menu: Menu.apotek),
];