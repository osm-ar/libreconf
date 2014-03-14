FOSS4G Buenos Aires
===================

Aplicación hecha con Ruby on Rails para administrar la página oficial de la conferencia FOSS4G de Buenos Aires.

Para levantar la página localmente
----------------------------------

1. Instalar [RVM](https://rvm.io/)

2. Instalar Ruby 1.9.3

    `rvm install 1.9.3`

3. Clonar el respositorio

    `git clone https://github.com/maurimiranda/foss4gba.git`

4. Entrar en el directorio y debería crearse el gemset foss4gba

    `rvm info`

5. Instalar bundler

    `gem install bundler`

6. Instalar las gemas necesarias
    
    `bundle install`

7. Crear la base de datos

    `rake db:create`

8. Correr las migraciones

    `rake db:migrate`

9. Arrancar el servidor
    
    `rails server`

10. Navegar el sitio 

    [http://localhost:3000](http://localhost:3000)
