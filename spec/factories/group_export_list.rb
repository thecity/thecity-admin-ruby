module TheCityAdmin
  FactoryGirl.define do
  
    factory :group_export_list, :class => TheCity::GroupExportList do
      total_entries 0
      total_pages 0
      per_page 15
      current_page 1
      #exports {}
    end

  end
end