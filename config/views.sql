/*Drug List*/
CREATE OR REPLACE VIEW vw_drug_list AS
	SELECT
		d.id, IF(g.abbreviation = '', CONCAT_WS(' ', g.name, CONCAT_WS(' ', d.strength, f.name)), CONCAT_WS(') ', CONCAT_WS(' (', g.name, g.abbreviation), CONCAT_WS(' ', d.strength, f.name))) name, d.packsize pack_size
	FROM tbl_drug d
	INNER JOIN tbl_generic g ON g.id = d.generic_id
	INNER JOIN tbl_formulation f ON f.id = d.formulation_id
	ORDER BY id

/*Regimen List*/
CREATE OR REPLACE VIEW vw_regimen_list AS
	SELECT
		r.id, CONCAT_WS(' | ', r.code, r.name) name, r.description, c.name category, s.name service, l.name line
	FROM tbl_regimen r
	INNER JOIN tbl_category c ON c.id = r.category_id
	INNER JOIN tbl_service s ON s.id = r.service_id
	INNER JOIN tbl_line l ON l.id = r.line_id
	ORDER BY id