json.array! @titles do |title|
    json.number title.number
    json.content title.description
    json.new title.new
    json.chapters title.chapters do |chapter|
        json.content chapter.description
        json.new chapter.new
        json.articles chapter.articles do |article|
            json.number article.number 
            json.content article.content
            json.new article.new
            json.subArticles article.subarticles do |sa|
                json.number sa.number
                json.content sa.content
            end
            json.proposed_changes article.metadata do |metadata|
                json.content metadata.content
                json.subArticles metadata.metadatum_subarticles do |msa|
                    json.content msa.content
                    json.number msa.number
                end
            end
        end
    end
  end