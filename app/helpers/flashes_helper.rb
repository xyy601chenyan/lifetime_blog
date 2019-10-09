module FlashesHelper
  #创建提示信息的html属性，进行冻结防止修改
  FLASH_CLASSES = {alert: "danger", notice: "success", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch(key.to_sym,key)
  end

  def user_facing_flashes
    flash.to_hash.slice("alert","notice","warning")
  end
end
