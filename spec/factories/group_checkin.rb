module TheCityAdmin
  FactoryGirl.define do
  
    factory :group_checkin, :class => TheCityAdmin::GroupCheckin do
      #group {"name" => "Third Grade", "external_id" => nil, "id" => 494538351}  
      checked_out_by_user nil 
      special_instructions "No snacks!" 
      parent_group_name "Ballard Childrens ministry" 
      callboard_number "102" 
      checked_in_at "07/16/2012 07:59 PM (UTC)" 
      barcode "12BB97E001" 
      checked_in_user "Johnny Shepherd" 
      checked_in_user_id 282384270 
      id 3 
      checked_in_by_user "Pastor Sam Shepherd" 
      checked_in_by_user_id 946060874
      parent_receipt_barcode "BC6C285ACE5" 
      # event {"id" => 587598132, 
      #        "title" => "5 PM Service", 
      #        "starting_at" => "07/10/2012 12:00 AM (UTC)",
      #        "ending_at" => "07/10/2012 01:30 AM (UTC)"} 
      checked_in_user_notes "Gluten-Free" 
      checked_out_at nil 
      parent_group_id 49861013 
      pager_number 45 
    end

  end
end






