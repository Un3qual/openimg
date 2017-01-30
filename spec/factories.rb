FactoryGirl.define do
  factory :flag do
    user nil
    comment "MyText"
    reason 1
    image nil
    action_taken false
    action 1
    action_taken_by "MyString"
    action_comment "MyText"
  end
  factory :user do
    
  end
  factory :image do
    caption "MyText"
    file_type "MyString"
    s3_file_name "MyText"
  end
end
