module TheCity
  FactoryGirl.define do

    factory :group_checkin_event, :class => TheCity::GroupCheckinEvent do
      id 123456789
      group_id 587598132
      group_name 'Ballard Childrens ministry'
      title '5 PM Service'
      starting_at '07/10/2012 12:00 AM (UTC)'
      ending_at '07/10/2012 01:30 AM (UTC)'
      shadow_event_ids []
    end
  end
end






