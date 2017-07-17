#!/usr/bin/env ruby

# file: botbase-module-demo.rb

# A service module used by the BotBase gem

class BotBaseModuleDemo
  
  def initialize(x=nil)
    
    @phrases = {}
    service_modules = nil
    
    a = if service_modules then
    
      service_modules

    else
      
      @h = {
          "^What's the time?" => "'The time is ' + Time.now.strftime(\"%-I:%M%p\")",
          "hello?" => %q("hello #{sender}, how can I help you?" % sender),
          'unknown' => "\"I'm sorry, I don't understand what you said.\""
      }
      [@h]

    end
    
    a.each {|x|  @phrases.merge! x }  

  end

  def query(sender='user01', msg, mode: :chat, echo_node: 'node1')
    r = @phrases.detect {|k,v|  msg =~ /#{k}/i }

    raw_msg = if r then
      r.last 
    else  
      @h['unknown']      
    end
    
    response = eval raw_msg   
  end

end