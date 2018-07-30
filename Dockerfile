FROM projectriff/java-function-invoker:0.0.7
ARG FUNCTION_JAR=/functions/function.jar
ARG FUNCTION_HANDLER=functions.Upper
ADD ./target/*.jar $FUNCTION_JAR
ENV FUNCTION_URI file://${FUNCTION_JAR}?handler=${FUNCTION_HANDLER}
