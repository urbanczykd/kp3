# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def javascript(*files)
		content_for(:head) { javascript_include_tag(*files) }
	end


      include WillPaginate::ViewHelpers 
      def will_paginate_with_i18n(collection, options = {}) 

        will_paginate_without_i18n(collection, options.merge(
        :prev_label => I18n.t('previous', :default => 'Previous'), 
        :next_label => I18n.t('next', :default => 'Next'))) 

      end 
      alias_method_chain :will_paginate, :i18n  


      def generuj_rok(rok)
#nazwy= ['zero','jeden','dwa','trzy','cztery','piec','szesc','siedem','osiem','dziewiec']
rok.to_s.split('').map {|r| tag("img", { :src => "/images/pk/kalendarz/cyfry/0#{[r.to_i]}.png" }, false, false) }.join
      end

      def generuj_miesiac(miesiac)
          miesiac = miesiac.to_s.split(//)
        if miesiac[0] == "0"
        else 
          miesiac = "0"+miesiac.to_s
        end
   tag("img", { :src => "/images/pk/kalendarz/miesiace/msc_#{miesiac}.png"}, false, false)
      end
############################################################################
      def pokaz_miejsce(miejsce_id)
        @miejsce = Place.find(miejsce_id)
        @content = "Nazwa: "+@miejsce.title+"<br />"
        @content << "Adres: "+@miejsce.adres+"<br />"
        @content << "Telefon:"+@miejsce.telephone+"<br />"
        @content << "e-mail: <a href=mailto:"+@miejsce.email+">"+@miejsce.email+"</a><br />"
        @content << "strona: <a href=http://"+@miejsce.web+">"+@miejsce.web+"</a><br /"
        return @content
      end
      
      def pokaz_event(event_id)
        @event = Event.find(event_id)
        @content2 = "<h1>"+@event.title+"</h1>"
        @content2 << @event.body+@event.more
        return @content2
      end
      
      def pokaz_cene(event_id)
        @cena = Event.find(event_id).price
         if @cena == 'free' || @cena == 'f' || @cena == '' then
          @content3 = "<img src=/images/pk/ico_wstep_wolny_short.png>"
#            @centent3 = "<img src=\"/images/pk/ico_wstep_wolny_short.png\">"         
          else 
            @content3 = "bilety: "+@cena+" zł"
          end
        return @content3
      end
      


      def pol2ascii(chain)
        pol = { 'ą' => 'a', 'ę' => 'e', 'ź' => 'z', 'ć' => 'c', 'ł' => 'l', 'ż' => 'z', 'ó' => 'o', 'ś' => 's', 'Ą' => 'A', 'Ę' => 'E', 'Ź' => 'Z', 'Ć' => 'C', 'Ł' => 'L', 'Ż' => 'Z', 'Ó' => 'O', 'Ś' => 'S', 'ń' => 'n', 'Ń' => 'N'}
          word = ""
          chain.split(//).each do |l|
               pol.has_key?(l) ? word << pol[l] : word << l 
          end
          return word
      end 
      
      def pol2month(month)
        names = {'01' =>'stycznia', '02' =>'lutego','03' =>'marca' ,'04' =>'kwietnia' ,'05' => 'maja' ,'06' =>'czerwca' ,'07' => 'lipca' ,'08'=>'sierpnia' ,'09'=>'września','10'=>'października' ,'11'=>'listopada' ,'12'=>"grudnia" }
          miesiac =""
          names.each do |key, value|
            if month == key
               miesiac = value
            end
          end
          return miesiac
      end
      def pol2day(dzien)
        names = {'0' =>'niedziela', '1' =>'poniedziałek', '2'=> 'wtorek','3' => 'środa' ,'4' => 'czwartek' ,'5' => 'piątek' ,'6' => 'sobota'}
         day1 =""
        names.each do |key, value|
          if dzien == key
               day1 = value
            end
          end
          return day1
      end
     
      def menu_k
          menu="#{link_to("",muzyka_index_path,:class=>'menu_t',:id=>'muzykat')}"
          menu<<"#{link_to("", galerie_index_path, :class => 'menu_t', :id => 'galeriet')}"
          menu << "#{link_to("", teatr_index_path, :class => 'menu_t', :id => 'teatrt')}"
          menu << "#{link_to("", film_index_path, :class => 'menu_t', :id => 'filmt')}"
          menu << "#{link_to("", ksiazki_index_path, :class => 'menu_t', :id => 'ksiazkit')}"
          menu << "#{link_to("", muzea_index_path, :class => 'menu_t', :id => 'muzeat')}"
          menu << "#{link_to("", rozmaitosci_index_path, :class => 'menu_t', :id => 'rozmaitoscit')}"
          return menu
      end
      def menu_a(kontroler)
        if (kontroler == 'muzyka') then 
          menu= "#{link_to("", muzyka_index_path, :class=>'menu_t',:id=>'muzykat_A')}" 
          else
          menu = "#{link_to("", muzyka_index_path, :class => 'menu_t', :id => 'muzykat')}" 
        end
        if (kontroler == 'galerie') then 
          menu << "#{link_to("", galerie_index_path, :class => 'menu_t', :id => 'galeriet_A')}"
          else
          menu << "#{link_to("", galerie_index_path, :class => 'menu_t', :id => 'galeriet')}"
        end
        if (kontroler == 'teatr') then 
          menu << "#{link_to("", teatr_index_path, :class => 'menu_t', :id => 'teatrt_A')}"
        else
          menu << "#{link_to("", teatr_index_path, :class => 'menu_t', :id => 'teatrt')}"
        end
        if (kontroler == 'film') then   
         menu << "#{link_to("", film_index_path, :class => 'menu_t', :id => 'filmt_A')}"
        else
         menu << "#{link_to("", film_index_path, :class => 'menu_t', :id => 'filmt')}"
        end
        if (kontroler == 'ksiazki') then 
          menu << "#{link_to("", ksiazki_index_path, :class => 'menu_t', :id => 'ksiazkit_A')}"
        else
          menu << "#{link_to("", ksiazki_index_path, :class => 'menu_t', :id => 'ksiazkit')}"
        end
        if (kontroler == 'muzea') then
          menu << "#{link_to("", muzea_index_path, :class => 'menu_t', :id => 'muzeat_A')}"
        else
          menu << "#{link_to("", muzea_index_path, :class => 'menu_t', :id => 'muzeat')}"
        end
        if (kontroler == 'rozmaitosci') then
          menu << "#{link_to("", rozmaitosci_index_path, :class => 'menu_t', :id => 'rozmaitoscit_A')}"
        else
          menu << "#{link_to("", rozmaitosci_index_path, :class => 'menu_t', :id => 'rozmaitoscit')}"
        end
          return menu
      end

      
end






















