args = [
  :label_text, :label_x, :label_y,
  :item_text, :item_x, :item_y,
  :label_length, :item_length
]

class FormField < Struct.new(*args)
end
