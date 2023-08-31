module MenusHelper
  def fav?(menu_id)
    menu = Menu.find_by(id: menu_id)
    if menu && menu.fav
      return true
    end
    return false
  end
end
