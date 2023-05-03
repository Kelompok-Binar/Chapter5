package com.example.challenge_chapter_4.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Time;

@Entity
@Data
@Table(name = "report")
@Getter
@Setter
public class ReportEntity {
    @Id
    private String id_report;
    private String film_name;
    private String tayang_atau_tidak;
    private Date tanggal_tayang;
    private Time jam_mulai;
    private Time jam_selesai;
    private int harga_tiket;
}
