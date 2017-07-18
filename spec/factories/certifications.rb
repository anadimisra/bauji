FactoryGirl.define do

  factory :certification do
    name "DevOps Foundation Certification"
    description "DevOps Foundation Certification"
    terms "DevOps Foundation Certification"
    seo_meta_keywords ["devops","devops certifications"]
    seo_meta_description "DevOps Foundation Certifications"
  end

  factory :invalid_certification, class: Certification do
    name "Name"
    description "DevOps Foundation Certification"
    terms "DevOps Foundation Certification"
    seo_meta_keywords ["devops","devops certifications"]
    seo_meta_description "Some description"
  end

  factory :new_valid_certification, class: Certification do
    name "DevOps Foundation Certification"
    description "DevOps Foundation Certification"
    terms "For terms and conditions please visit the terms and conditions link on footer"
    seo_meta_keywords ["devops","devops certifications"]
    seo_meta_description "DevOps Foundation Certifications"
  end

end
