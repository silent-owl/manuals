
module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize


      grant_on 'manuals#create', :badge => 'First manual', :temporary => true, :model_name => 'Manual' do |manual|
        manual.user.manuals.count >= 1
      end

      grant_on 'manuals#create', :badge => 'Experienced assistant', :temporary => true, :model_name => 'Manual' do |manual|
        manual.user.manuals.count >= 10
      end

      grant_on 'manuals#create', :badge => 'ManuALLman', :temporary => true, :model_name => 'Manual' do |manual|
        manual.user.manuals.count >= 20
      end
      
    end
  end
end
