class Game < ActiveRecord::Base
    belongs_to :user

    def self.valid_params?(params)
        return !params[:game_title].empty?
    end
    
end
