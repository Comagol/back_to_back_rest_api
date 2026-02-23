create or replace PACKAGE pkg_weekly_sales_upload AS 
  FUNCTION create_batch ( 
    p_file_name        IN VARCHAR2, 
    p_mime_type        IN VARCHAR2, 
    p_content_size     IN NUMBER, 
    p_uploaded_by      IN VARCHAR2, 
    p_template_version IN VARCHAR2 DEFAULT 'v1' 
  ) RETURN NUMBER; 
 
  PROCEDURE parse_upload ( 
    p_batch_id        IN NUMBER, 
    p_temp_file_name  IN VARCHAR2 
  ); 
 
  PROCEDURE validate_batch ( 
    p_batch_id IN NUMBER 
  ); 
 
  PROCEDURE process_batch ( 
    p_batch_id      IN NUMBER, 
    p_processed_by  IN VARCHAR2 DEFAULT NULL 
  ); 
END pkg_weekly_sales_upload;
/