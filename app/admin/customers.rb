ActiveAdmin.register Customer do
    permit_params :full_name, :phone_number, :email_address, :notes, :image, :province

  filter :full_name
  filter :phone_number
  filter :email_address

  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :province
    actions
  end
  

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :full_name
      f.input :province
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file,
              hint: (f.object.image.attached? ? image_tag(f.object.image, width: 120) : "Sin imagen")
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |c|
        image_tag(c.image, width: 200) if c.image.attached?
      end
    end
  end
end