FROM jboss/wildfly:10.1.0

ENV DBUSER postgres_db_user
ENV DBPASSWORD postgres_db_user_password
ENV DBHOST postgres_db_host
ENV DBPORT postgres_db_port
ENV DBNAME postgres_db_name
ENV JNDINAME wildfly_data_source_jndi_name
ENV CUSTOMIZATION  /opt/jboss/wildfly/customization
COPY --from=builder /tmp/customization $CUSTOMIZATION/

USER root
RUN chmod +x $CUSTOMIZATION/startup.sh && chown -R jboss: $CUSTOMIZATION/
USER jboss
CMD ["sh", "-c", "$CUSTOMIZATION/startup.sh"]

