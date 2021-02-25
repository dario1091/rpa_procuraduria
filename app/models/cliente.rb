class Cliente < ApplicationRecord
  # belongs_to :dtc
  # belongs_to :fni
  # belongs_to :tpd
  # belongs_to :cnt
  # belongs_to :bla

  def self.update_all_name
    driver = Selenium::WebDriver.for :chrome
    wait = Selenium::WebDriver::Wait.new(timeout: 20)
    wait_datos = Selenium::WebDriver::Wait.new(timeout: 3)

    begin
      puts "======================================================"
      clientes_procesar = Cliente.where(cli_nombre1: "")
      # caps = Selenium::WebDriver::Remote::Capabilities.new
      # caps["device"] = "iPhone 11"
      # caps["realMobile"] = "true"
      # caps["os_version"] = "14.0"
      # caps["javascriptEnabled"] = "true"
      # caps["name"] = "BStack-[Ruby] Sample Test" # test name
      # caps["build"] = "BStack Build Number 1" # CI/CD job or build name
      driver.get "https://www.procuraduria.gov.co/portal/index.jsp?option=co.gov.pgn.portal.frontend.component.pagefactory.AntecedentesComponentPageFactory&action=consultar_antecedentes"

      puts "SELECCIONAR IFRAME"
      driver.switch_to.frame(0)

      puts "ANTES DE BUSCAR EL SELECT"
      my_select = wait.until { driver.find_element(:id, "ddlTipoID") }
      puts "DESPUES DE BUSCAR EL SELECT"

      if my_select
        my_select.click
        my_select.find_elements(:tag_name => "option").find do |option|
          option.text == "Cédula de ciudadanía"
        end.click
      end

      puts "ANTES DE ENTRAR AL FOR"
      sleep(7)
      clientes_procesar.each_with_index do |cliente, index|
        # for i in 0..9
        puts "index : " + index.to_s
        my_btn_consultar = nil
        my_document_number = nil
        sleep(0.5)

        my_btn_consultar = wait_datos.until { driver.find_element(id: "btnConsultar") }

        my_document_number = wait.until { driver.find_element(id: "txtNumID") }
        my_document_number.clear

        my_document_number.send_keys (cliente.cli_cedula)
        sleep(2)

        my_btn_consultar.click
        begin
          my_respuesta = nil

          my_respuesta = wait.until { driver.find_element(class: "datosConsultado") }
        rescue => err
          my_respuesta = false
          puts "ERROR 001 " + err
        ensure
          if my_respuesta
            my_respuesta.find_elements(:tag_name => "span").each_with_index do |span, index|
              if index == 0
                cliente.cli_nombre1 = span.text
              end
              if index == 1
                cliente.cli_nombre2 = span.text
              end

              if index == 2
                cliente.cli_apellido1 = span.text
              end
              if index == 3
                cliente.cli_apellido2 = span.text
                break
              end
            end
            sleep(1)
            puts "GUARDAMOS EL CLIENTE : " + cliente.cli_id.to_s
            cliente.save
          else
            puts "--------------------------------------------"
            puts "CEDULA NO EXISTE"
            puts "--------------------------------------------"
            my_respuesta = wait.until { driver.find_element(id: "ValidationSummary1") }
            puts json: my_respuesta.text
          end
        end
      end
    rescue => err
      puts "ERROR 0002"
      # logger.error err.message
      puts err
      puts "ERROR 0002"
    ensure
      sleep(1)

      driver.quit
    end
  end
end
