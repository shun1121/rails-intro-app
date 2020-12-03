module IntrosHelper
  def self.upload_to_s3(key, data)
    #↓updateアクションにおいていた内容
    client = Aws::S3::Client.new(
    region: 'ap-northeast-1'
    ) 
    client.put_object（bucket:"introinfo", key:"test", body:json）
    # client.put_object(bucket:Rails.application.credentials.aws[:bucket], key:key, body:data)
  end
  # def self.ARTICLE_CATEGORY
  #   return {'ポートフォリオ':'p','受賞歴':'j', '資格':'s'}
  # end
  # def self.article_category_value_to_key(val)
  #   category = ProfilesHelper.ARTICLE_CATEGORY.find {|k,v| v == val}
  #   category[0]
  # end
end



