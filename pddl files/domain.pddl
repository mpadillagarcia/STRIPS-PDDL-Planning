;; Razonamiento y planificacion automatica
;; Actividad Laboratorio
;; Manuel Padilla Garcia

(define (domain dominio)
  (:requirements :typing :negative-preconditions)
  (:types
    
    ;; Definicion de los tipo de objeto
    location target locatable - object
    vehicle paquete - locatable
    capacity-number - object
  )

  (:predicates 
    
    ;; Definicion de los predicados
    
    (road ?l1 ?l2 - location)
    (at ?x - locatable ?v - location)
    (in ?x - paquete ?v - vehicle)
    (capacity-predecessor ?s1 ?s2 - capacity-number)

    ;; Define la capacidad s1 del vehiculo v
    (capacity-vehicle ?v - vehicle ?s1 - capacity-number)
    ;; Define la capacidad s1 de la localizacion l
    (capacity-location ?l - location ?s1 - capacity-number)
    ;; Define si una ubicacion puede procesar un paquete
    (puede-procesar ?l - location)
    ;; Define si se puede cargar un paquete en esa ubicacion
    (se-puede-cargar ?l - location)
    ;; Define si se puede descargar un paquete en esa ubicacion
    (se-puede-descargar ?l - location)
    ;; Define si una localizacion es una zona de entrega
    (zona-entrega ?l - location)
    ;; Define si un paquete ha sido procesado
    (paquete-procesado ?x - paquete)
    ;; Define si un paquete ha sido entregado
    (paquete-entregado ?x - paquete)
  )

  ;; Definicion de la accion 'drive', servira para desplazar el tren
  (:action drive
    :parameters (?v - vehicle ?l1 ?l2 - location)
    :precondition (and
        ;; Comprueba que el tren esta en la localizacion l1
        (at ?v ?l1)
        ;; Comprueba que el tren puede moverse desde la ubicacion l1 a l2
        (road ?l1 ?l2)
      )
    :effect (and
        ;; Define que el tren ya no se encuentra en l1 y ahora se encuentra en l2
        (not (at ?v ?l1))
        (at ?v ?l2)
      )
  )

  ;; Definicion de la accion 'procesar-paquete', servira para procesar un paquete en una localizacion valida
  (:action procesar-paquete
    :parameters (?x - paquete ?l - location)
    :precondition (and
            ;; Comprueba que el paquete esta en la localizacion l
            (at ?x ?l)
            ;; Comprueba que la localizacion l puede procesar paquetes
            (puede-procesar ?l)
            ;; Comprueba que el paquete no esta procesado
            (not(paquete-procesado ?x))
          )
    :effect (and
      ;; Define el paquete como procesado
      (paquete-procesado ?x)
    )
  )

  ;; Definicion de la accion 'entregar-paquete-procesado', servira para entregar un paquete 
  ;; ya procesado en una localizacion valida
  (:action entregar-paquete-procesado
    :parameters (?x - paquete ?l - location ?s3 ?s4 - capacity-number)
    :precondition (and
            (at ?x ?l)
            ;;Comprueba que en la localizacion se pueden entregar paquetes
            (zona-entrega ?l)
            ;; Comprueba que el paquete este procesado
            (paquete-procesado ?x)
            ;; Gestiona la capacidad del almacen, ya que en el se ha depositado un paquete para entregar
            (capacity-predecessor ?s3 ?s4 )
            (capacity-location ?l ?s3)
          )
    :effect (and
      ;; Define el paquete como entregado
      (paquete-entregado ?x)
      (capacity-location ?l ?s4)
      (not (capacity-location ?l ?s3))
    )
  )

  ;; Definicion de la accion 'pick-up', servira para coger un paquete de una localizacion y colocarlo en el tren
 (:action pick-up
    :parameters (?p - paquete ?v - vehicle ?s2 ?s1 - capacity-number ?l - location  ?s3 ?s4 - capacity-number)
    :precondition (and
        (at ?v ?l)
        (at ?p ?l)
        ;; Comprueba que en la localizacion se pueden cargar paquetes
        (se-puede-cargar ?l)
        ;; Gestiona las capacidades del tren y la localizacion
        (capacity-predecessor ?s1 ?s2)
        (capacity-predecessor ?s3 ?s4)
        ;; Comprueba la capacidad del tren
        (capacity-vehicle ?v ?s2)
        ;; Comprueba la capacidad de la localizacion
        (capacity-location ?l ?s3)
      )
    :effect (and
        (not (at ?p ?l))
        (in ?p ?v)
        ;; Nueva capacidad del tren
        (capacity-vehicle ?v ?s1)
        ;; Antigua capacidad del tren
        (not (capacity-vehicle ?v ?s2))
        ;; Nueva capacidad de la localizacion
        (capacity-location ?l ?s4)
        ;; Antigua capacidad de la localizacion
        (not (capacity-location ?l ?s3))
      )
  )

  ;; Definicion de la accion 'drop', servira para quitar un paquete del tren y dejarlo en una localizacion
  (:action drop
    :parameters (?p - paquete ?v - vehicle ?s1 ?s2 - capacity-number ?l - location  ?s4 ?s3 - capacity-number)
    :precondition (and
        (at ?v ?l)
        (in ?p ?v)
        ;; Comprueba que en la localizacion se pueden descargar paquetes
        (se-puede-descargar ?l)
        ;; Gestiona las capacidades del tren y la localizacion
        (capacity-predecessor ?s1 ?s2)
        (capacity-predecessor ?s3 ?s4)
        (capacity-vehicle ?v ?s1)
        (capacity-location ?l ?s4)
      )
    :effect (and
        (not (in ?p ?v))
        (at ?p ?l)
        ;; Nueva capacidad del tren
        (capacity-vehicle ?v ?s2)
        ;; Antigua capacidad del tren
        (not (capacity-vehicle ?v ?s1))
        ;; Nueva capacidad de la localizacion
        (capacity-location ?l ?s3)
        ;; Antigua capacidad de la localizacion
        (not (capacity-location ?l ?s4))
      )
  )

)