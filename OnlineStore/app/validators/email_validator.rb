class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    unless value =~ /^((?!\.)[a-z0-9._%+-]+(?!\.)\w)@[a-z0-9-]+\.[a-z.]{1,5}(?!\.)\w$/i
      record.errors[attribute] << "is not a valid email"
    end
  end
end