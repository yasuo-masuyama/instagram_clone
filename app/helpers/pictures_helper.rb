module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new'
        confirm_pictures_path
    elsif action_name == 'edit'
        picture_path(@picture.id)
    end
  end
end
