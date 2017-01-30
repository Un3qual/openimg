FactoryGirl.define do
  factory :user do
    
  end
  factory :image do
    caption "MyText"
    file_type "MyString"
    s3_file_name "MyText"
  end
end
