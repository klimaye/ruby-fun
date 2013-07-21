module WritingQuality
    CLICHES = [ /play fast and loose/,
                  /make no mistake/,
                  /does the trick/,
                  /off and running/,
                  /my way or the highway/ ]
      def number_of_cliches
            CLICHES.inject(0) do |count, phrase|
                    count += 1 if phrase =~ @contents
                    count
            end
      end
end
