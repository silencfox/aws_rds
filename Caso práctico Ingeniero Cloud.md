Caso Práctico: Gestión de infraestructura como código (IaC) y 
ambientes de nube AWS ## DEUNA ##

###############################################################################
3. Implementación de recursos AWS mediante IaC:
    1. Proyecto Del repositorio comprimido en zip
       https://github.com/silencfox/aws_rds
    

###############################################################################	
1. Monitoreo del escalamiento de microservicios:

	La verificacion de las tareas se puede hacer de diferentes maneras, aqui algunas opciones:
	
    Opcion 1
        Analizar en Live Tail (CloudWatch) los eventos correspondiente a RunningTaskCount o TaskCount que sea igual o mayor al limite de instancias

        filtrando por :
        ** /aws/ecs/containerinsights/NombreCluster/performance
        ClusterTelemetry-NombreCluster

    Opcion 2

        Validar el grupo de logs correspondiente "/aws/ecs/containerinsights/Nombre_Cluster/performance"
        buscar en ServiceTelemetry-Nombre_Del_Servicio o ClusterTelemetry-Nombre_Del_Cluster las siguientes entradas:
        DesiredTaskCount o taskcount >= limite deseado


    Opcion 3
		
        Crear una regla en EventBridge que guarde los logs correspondiente en un grupo de logs
        1 - dar a crear regla en eventBridge, dar nombre, descripcion y event bus, si no tienes usa el default
            Selecciona "Rule with a event pattern"  dar Next
        2 - Source AWS Event
            Use pattern form
            Event source                : AWS Services
            AWS service                 : Elastic Container Service
            Event Typo                  : state change
            Event Type Specification 1  : Specific detail type(s) "ECS Container Instance State Change"
            Event Type Specification 2  : Any cluster o un cluster especifico

        3. Se generara el pattern :
            {
            "source": ["aws.ecs"],
            "detail-type": ["ECS Container Instance State Change"]
            }
            dar Next
        4. Seleccionar Target types : AWS service "CloudWatch log Group"
            Seleccionar un grupo de eventos o crear uno nuevo
            Luego dar next next next

    Opcion 4
        1. Crear una Alarma usando la metrica metrica ECS/ContainerInsights DesiredTaskCount o taskcount >= limite deseado

        ClusterName
        Statistic   average
        Period 5m
        Threshold type static
        Whenever TaskCount is.. Whenever TaskCount is.. # deseado
        si desea configurar un SNS para enviar por correo o enviar a un lambda y guardarlo en un grupo de logs


###############################################################################
2. Monitoreo de costos de transacciones monetarias y no monetarias:
    
    No tengo amplio conocimiento sobre manejo de costos,
    Este caso debe ser analizado con el segmento de bill de AWS
    (Cost Explorer, cost and usage report, y la implementacion de etiquetas para identificar cada operacion entrante)
