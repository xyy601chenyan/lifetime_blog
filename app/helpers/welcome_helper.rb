module WelcomeHelper

  def random_background_image
    #file_names = Dir.glob(Rails.root.join("public/background/*").to_s)
    #file_names = Dir.entries("app/assets/images")
    file_names = Dir.entries("public/background")
    useless_lists = [".","..",".keep",".DS_Store"]

    useless_lists.each do |list|
      file_names.delete(list)
    end
    random_image = file_names.sample
    return "background/#{random_image}"


  end
end
