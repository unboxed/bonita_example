require 'httpclient'

class BonitaHandler
    
  def initialize    
    connection.set_auth(domain, user, password)    
  end
  
  def processes
    res = connection.post(domain + "/queryRuntimeAPI/getProcessInstances", body)
    result = Hash.new
    Nokogiri::XML(res.content).xpath("//ProcessInstance").each do |process|
      result[process.xpath("instanceUUID").text.strip] = process.xpath("state").text
    end
    result
  end
  
  def create_process
    res = connection.post(domain + "/runtimeAPI/instantiateProcessWithVariables/MyProcess--1.0", body)    
    Nokogiri::XML(res.content).text.strip
  end
  
  def process_state process_uuid
    res = connection.post(domain + "/queryRuntimeAPI/getProcessInstance/#{process_uuid}", body)
    Nokogiri::XML(res.content).xpath("//ProcessInstance/state").text
  end
  
  def config
    @config ||= YAML.load_file("config/bonita.yml")[Rails.env].with_indifferent_access
  end
  
  def connection
    @connection ||= HTTPClient.new
  end
  
  def domain
    @domain ||= config[:domain]
  end
  
  def user
    @user ||= config[:user]
  end
  
  def password 
    @password ||= config[:password]
  end
  
  def body
    body = { 'options' => 'user:admin'}
  end
    
end