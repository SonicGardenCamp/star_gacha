module MenusHelper
  def fav?(menu_id)
    menu = Menu.find_by(id: menu_id)
    return true if menu && menu.fav

    false
  end
end
