

This gem (not yet) is useful for avoiding to have multiple conditiones when printing (rendering) the value of
a variable.


Spanish:

Ideas acerca del objeto wrapper y encadenable.

Por ejemplo, funcionaría de la siguiente forma:


@product.specific_product.ad_kind.try :name
-> @product.nullo.specific_product.ad_kind.name

@order.sales_person_secundary_id.blank? ? "--" : @order.secundary_sales_person.name
-> @order.nullo('--').secundary_sales_person.name


Reglas de funcionamiento

- cuando se manda a llamar sobre el objeto, lo que se regresa es el objeto nullo que envuelve al objeto.

- si el objeto es nil:
 - debe comportarse como el null object. es decir, regresar nil? true, etc. pero el to_s debe regresar '' o '--' (parámetro)
 
- si el objeto no es nil, 
 - debe interceptar todas las llamadas y regresar el wrapper del objeto.
 - que pasa si el método llamado es to_s ??, porque en teoría debería regresar el string, y no el wrapper
 
- quiza, si el método llamado regresa string, no se pone como el objeto? pero que ocurre si dicho string tiene un método el cual regresa nil?

- igual sólo su método to_s debe regresar string.

Idea básica
objeto nullo < BlankSlate o BasicObject
  @parent = objeto padre
  
  def to_s
    if @parent == nil
      ''  # o el parametro '--'
    else
      @parent.to_s
    
  def method_missing
    # siempre se manda a llamar
    result @parent.method
    result.nullo  # se envuelve el resultado en este mismo objeto
    
  # más propiedades del objeto nullo
  
end