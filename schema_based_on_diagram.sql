/* Database schema_based_on_diagram to keep the structure of entire database. */

CREATE TABLE patients (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    date_of_birth date,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id int,
    FOREIGN KEY (patient_id)
    REFERENCES patients(id),
    status varchar(255),
    PRIMARY KEY (id),
);

CREATE INDEX ids_patient_id ON medical_histories (patient_id);


CREATE TABLE invoices (
    id int GENERATED ALWAYS AS IDENTITY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_medical_history_id ON invoices (medical_history_id);

