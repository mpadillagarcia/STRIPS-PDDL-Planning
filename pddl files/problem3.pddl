;; Razonamiento y planificacion automatica
;; Actividad Laboratorio
;; Manuel Padilla Garcia

(define (problem problema_parte3)
 (:domain dominio)
 (:objects
   
  ;; Definicion de los objetos del problema
  almacen-1 almacen-2 puerto-1 puerto-2 ciudad fabrica-1 fabrica-2 fabrica-3 - location
  tren - vehicle
  ;;tren2 - vehicle

  ;; Numero de paquetes del problema
  paquete-1 - paquete
  paquete-2 - paquete
  paquete-3 - paquete
  paquete-4 - paquete
  paquete-5 - paquete
  paquete-6 - paquete
  paquete-7 - paquete
  paquete-8 - paquete
   
     
  ;; Definicion de numeros para capacidades
  capacity-0 - capacity-number
  capacity-1 - capacity-number
  capacity-2 - capacity-number
  capacity-3 - capacity-number
  capacity-4 - capacity-number
  capacity-5 - capacity-number
  capacity-6 - capacity-number
  capacity-7 - capacity-number
  capacity-8 - capacity-number
  capacity-9 - capacity-number
  capacity-10 - capacity-number
  capacity-11 - capacity-number
  capacity-12 - capacity-number
  capacity-13 - capacity-number

 )
 (:init
     
  ;; Definicion de numeros sucesivos
  (capacity-predecessor capacity-0 capacity-1)
  (capacity-predecessor capacity-1 capacity-2)
  (capacity-predecessor capacity-2 capacity-3)
  (capacity-predecessor capacity-3 capacity-4)
  (capacity-predecessor capacity-4 capacity-5)
  (capacity-predecessor capacity-5 capacity-6)
  (capacity-predecessor capacity-6 capacity-7)
  (capacity-predecessor capacity-7 capacity-8)
  (capacity-predecessor capacity-8 capacity-9)
  (capacity-predecessor capacity-9 capacity-10)
  (capacity-predecessor capacity-10 capacity-11)
  (capacity-predecessor capacity-11 capacity-12)
  (capacity-predecessor capacity-12 capacity-13)

  
  ;; Definicion de los posibles movimientos de nuestro vehiculo 
  (road almacen-1 puerto-2)
  (road puerto-2 almacen-1)
  (road puerto-2 puerto-1)
  (road puerto-1 puerto-2)
  (road puerto-1 ciudad)
  (road ciudad puerto-1)
  (road ciudad fabrica-3)
  (road fabrica-3 ciudad)
  (road fabrica-3 fabrica-2)
  (road fabrica-2 fabrica-3)
  (road fabrica-2 fabrica-1)
  (road fabrica-1 fabrica-2)
  (road fabrica-1 almacen-2)
  (road almacen-2 fabrica-1)
  (road almacen-2 almacen-1)
  (road almacen-1 almacen-2)

  ;; Definicion de la ubicacion de los paquetes y tren al inicio del problema
  (at paquete-1 puerto-1)
  (at paquete-2 puerto-1)
  (at paquete-3 puerto-1)
  (at paquete-4 puerto-1)
  (at paquete-5 puerto-2)
  (at paquete-6 puerto-2)
  (at paquete-7 puerto-2)
  (at paquete-8 puerto-2)
  (at tren almacen-1)
  ;;(at tren2 puerto)


  ;; Definicion del estado entregado de los paquetes
  (not(paquete-entregado paquete-1))
  (not(paquete-entregado paquete-2))
  (not(paquete-entregado paquete-3))
  (not(paquete-entregado paquete-4))
  (not(paquete-entregado paquete-5))
  (not(paquete-entregado paquete-6))
  (not(paquete-entregado paquete-7))
  (not(paquete-entregado paquete-8))

  
  ;; Definicion de predicados para permitir acciones
  (puede-procesar fabrica-1)
  (puede-procesar fabrica-2)
  (puede-procesar fabrica-3)

  (se-puede-descargar almacen-1)
  (se-puede-descargar almacen-2)
  (se-puede-descargar fabrica-1)
  (se-puede-descargar fabrica-2)
  (se-puede-descargar fabrica-3)

  (se-puede-cargar almacen-1)
  (se-puede-cargar almacen-2)
  (se-puede-cargar fabrica-1)
  (se-puede-cargar fabrica-2)
  (se-puede-cargar fabrica-3)
  (se-puede-cargar puerto-1)
  (se-puede-cargar puerto-2)
  
  (zona-entrega almacen-1)
  (zona-entrega almacen-2)

  
  ;; Definicion de las capacidades del tren y de las localizaciones
  (capacity-vehicle tren capacity-6)
  ;;(capacity-vehicle tren2 capacity-4)
  (capacity-location almacen-1 capacity-2)
  (capacity-location almacen-2 capacity-2)
  (capacity-location fabrica-1 capacity-2)
  (capacity-location fabrica-2 capacity-2)
  (capacity-location fabrica-3 capacity-2)
  (capacity-location puerto-1 capacity-0)
  (capacity-location puerto-2 capacity-0)

 )
 (:goal (and
  ;;(at paquete-1 almacen)
  ;;(at paquete-2 almacen)
  ;;(at paquete-3 almacen)
  ;;(at paquete-4 almacen)
  ;;(at paquete-5 almacen)
  ;;(at paquete-6 almacen)
  ;;(at paquete-7 almacen)
  ;;(at paquete-8 almacen)

     
  ;; Definicion del estado meta del problema
  (paquete-entregado paquete-1)
  (paquete-entregado paquete-2)
  (paquete-entregado paquete-3)
  (paquete-entregado paquete-4)
  (paquete-entregado paquete-5)
  (paquete-entregado paquete-6)
  (paquete-entregado paquete-7)
  (paquete-entregado paquete-8)
 ))
)