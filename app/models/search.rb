class Search < ActiveRecord::Base
    has_many :tweets

    def self.search_compare
      current = Search.last.search
      matches = Search.where(search: current)
      if matches.length >= 2
        # binding.pry
        # puts "\nWould you like to compare the last time the #{lastSearchstring} was checked?\n"
          # rows = []
          # headings = []
          # headings << ["~*#{current}*~", "Now", "Then"]
          # rows << ['Vibe', matches.last.vibe, matches[-2].vibe]
          # rows << ['Score', "#{matches.last.score}", "#{matches[-2].score}"]
          # table = Terminal::Table.new :headings => headings, :rows => rows

          # rows = []
          rows1 = ['VIBE']
          rows2 = ['SCORE']
          stamps = []

          # headings = []


          # matches = matches.reverse



          matches.each do |match|
            rows1 << [match.vibe]
            rows2 << [match.score]
            stamps << match.created_at.to_s
          end

          # binding.pry


          table = Terminal::Table.new :headings => ['HELLO', 'NOW'] do |t|
            # t.headings << stamps
            # binding.pry
            t << rows1.flatten
            t.add_row rows2.flatten
        end


          puts table




      end

    end
end
