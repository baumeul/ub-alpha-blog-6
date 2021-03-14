

![showarticles](/Users/ulrichbaumeister/Development/Rails/ub-alpha-blog-6/showarticles.png)



# Manuelles Erstellen der notwendigen Schritte zur Anzeige eines Artikels

1. ROUTE
   Datei `config/routes.rb`

   ```ruby
   Rails.application.routes.draw do
     root 'alphablog#index'
     get 'about', to: 'alphablog#about'
     resources :articles, only: [:show]	# <==
   end
   ```

2. CONTROLLER
   Datei `app/controllers/articles_controller.rb` anlegen.

   ```bash
   $ touch app/controllers/articles_controller.rb
   ```

   Im Controller die Klasse `ArticlesController`  mit der Methode  `show` einfügen:

   ```ruby
   class ArticlesController < ApplicationController
     def show
     end
   end
   ```

   

3. VIEW
   Datei `app/views/articles/show.html.erb` anlegen. 

   ```bash
   $ mkdir app/views/articles
   $ touch app/views/articles/show.html.erb
   ```

   Zur Kontrolle eine Überschrift einfügen

   ```html
   <h1>SHOW ARTICLE DETAILS</h1>
   ```

4. Im Browser über `127.0.0.1:3000/articles/1` prüfen, ob die Überschrift angezeigt wird.

5. Den Artikel mit der in der URL spezifizierten Id anzeigen:

   Einer Instanzvariable `@article` das Ergebnis aus `Article.find(params[:id]` zuweisen. Damit steht der Wert in den Views überall zur Verfügung.

   ```ruby
   class ArticlesController < ApplicationController
     def show
       @article = Article.find(params[:id])	# <==
     end
   end
   ```

   Die Instanzvariable in der View auslese und den Inhalt anzeigen:

   ```html
   <h1>SHOW ARTICLE DETAILS</h1>
   <p><strong>Title: </strong><%= @article.title %></p>
   <p><strong>Description: </strong><%= @article.description %></p>
   ```

6. DEBUG
   Füge der Controllermethode `show` das Schlüsswort `byebug` hinzu:

   ```ruby
   class ArticlesController < ApplicationController
     def show
       byebug	# <==
       @article = Article.find(params[:id])
     end
   end
   ```

   Die Ausführung wird angehalten und die Debug Console angezeigt:

   ```bash
   Started GET "/articles/2" for 127.0.0.1 at 2021-03-14 19:14:30 +0100
      (0.4ms)  SELECT sqlite_version(*)
      (0.4ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
   Processing by ArticlesController#show as HTML
     Parameters: {"id"=>"2"}
   
   [1, 8] in /Users/ulrichbaumeister/Development/Rails/ub-alpha-blog-6/app/controllers/articles_controller.rb
      1: class ArticlesController < ApplicationController
      2: 
      3:   def show
      4:     byebug
   => 5:     @article = Article.find(params[:id])
      6:   end
   ```

   Eingabe von `params` am Prompt `(byebug)`: 

   ```bash
   (byebug) params
   #<ActionController::Parameters {"controller"=>"articles", "action"=>"show", "id"=>"2"} permitted: false>
   (byebug)
   ```

   Eingabe von `continue` führt den Vorgang weiter und beendet den Debugger:

   ```bash
   (byebug) continue 
     Article Load (0.2ms)  SELECT "articles".* FROM "articles" WHERE "articles"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
     ↳ app/controllers/articles_controller.rb:5:in `show'
     Rendering layout layouts/application.html.erb
     Rendering articles/show.html.erb within layouts/application
     Rendered articles/show.html.erb within layouts/application (Duration: 1.1ms | Allocations: 384)
   [Webpacker] Everything's up-to-date. Nothing to do
     Rendered layout layouts/application.html.erb (Duration: 13.6ms | Allocations: 6427)
   Completed 200 OK in 202730ms (Views: 17.1ms | ActiveRecord: 1.0ms | Allocations: 71721)
   ```

   

