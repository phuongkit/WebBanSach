package entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Sach")
public class Sach {
	private String maSach;
	private String tenSach;
	private String maLS;
	private String maTG;
	private String maNXB;
	private String ngayTao;
	private float soLuongDaBan;
	private float soLuongHienCo;
    private float giaBan;
    private float giaMua;
    private String moTa;
    
    
    
    
//    private Set<Sach> sachs = new HashSet<Sach>(0);
    
    @Id
	@Column(name = "maSach", length = 10)
	public String getMaSach() {
		return maSach;
	}
    
	public Sach(String maSach, String tenSach, String maLS, String maTG, String maNXB, String ngayTao, float soLuongDaBan,
		float soLuongHienCo, float giaBan, float giaMua) {
	this.maSach = maSach;
	this.tenSach = tenSach;
	this.maLS = maLS;
	this.maTG = maTG;
	this.maNXB = maNXB;
	this.ngayTao = ngayTao;
	this.soLuongDaBan = soLuongDaBan;
	this.soLuongHienCo = soLuongHienCo;
	this.giaBan = giaBan;
	this.giaMua = giaMua;
}

	public Sach() {}
	
	public void setMaSach(String maSach) {
		this.maSach = maSach;
	}

	@Column(name = "tenSach", length = 50, nullable = false)
	public String getTenSach() {
		return tenSach;
	}

	public void setTenSach(String tenSach) {
		this.tenSach = tenSach;
	}

	@Column(name = "moTa", length = 50, nullable = false)
	public String getMota() {
		return moTa;
	}

	public void setMota(String moTa) {
		this.moTa = moTa;
	}

	@Column(name = "ngayTao", length = 50, nullable = false)
	public String getNgayTao() {
		return ngayTao;
	}

	public void setNgTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}

	@Column(name = "soLuongDaBan", nullable = false)
	public float getSoLuongDaBan() {
		return soLuongDaBan;
	}

	public void setSoLuongDaBan(float soLuongDaBan) {
		this.soLuongDaBan = soLuongDaBan;
	}

	@Column(name = "soLuongHienCo", nullable = false)
	public float getSoLuongHienCo() {
		return soLuongHienCo;
	}

	public void setSoLuongHienCo(float soLuongHienCo) {
		this.soLuongHienCo = soLuongHienCo;
	}

	@Column(name = "giaBan", nullable = false)
	public float getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(float giaBan) {
		this.giaBan = giaBan;
	}

	@Column(name = "giaMua", nullable = false)
	public float getGiaMua() {
		return giaMua;
	}

	public void setGiaMua(float giaMua) {
		this.giaMua = giaMua;
	}

	@Column(name = "maNXB", length = 50, nullable = false)
	public String getMaNXB() {
		return maNXB;
	}

	public void setMaNXB(String maNXB) {
		this.maNXB = maNXB;
	}

	@Column(name = "maLS", length = 50, nullable = false)
	public String getMaLS() {
		return maLS;
	}

	public void setMaLS(String maLS) {
		this.maLS = maLS;
	}

	@Column(name = "maTG", length = 50, nullable = false)
	public String getMaTG() {
		return maTG;
	}

	public void setMaTG(String maTG) {
		this.maTG = maTG;
	}

//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "maSach")
//	public Set<Sach> getSachs() {
//		return sachs;
//	}
//
//	public void setSachs(Set<Sach> sachs) {
//		this.sachs = sachs;
//	}
}
