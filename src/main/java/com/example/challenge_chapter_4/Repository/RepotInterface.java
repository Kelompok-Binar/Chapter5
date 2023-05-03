package com.example.challenge_chapter_4.Repository;

import com.example.challenge_chapter_4.Model.ReportEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepotInterface extends JpaRepository<ReportEntity, String> {
}
