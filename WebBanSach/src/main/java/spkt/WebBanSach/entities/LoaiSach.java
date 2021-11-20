package spkt.WebBanSach.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "LoaiSach")
public class LoaiSach {
	private String maLoaiSach;
	private String tenLoaiSach;
	
	private Set<LoaiSach> loaisachs = new HashSet<LoaiSach>(0);
	
	public LoaiSach() {
		
	}
	
	public LoaiSach(String maLoaiSach, String tenLoaiSach) {
		this.maLoaiSach = maLoaiSach;
		this.tenLoaiSach = tenLoaiSach;
	}
	
	@Id
	@Column(name = "maLoaiSach", length = 10)
	public String getMaLoaiSach() {
		return maLoaiSach;
	}

	public void setMaLoaiSach(String maLoaiSach) {
		this.maLoaiSach = maLoaiSach;
	}
	
	@Column(name = "tenLoaiSach", length = 50, nullable = false)
	public String getTenLoaiSach() {
		return tenLoaiSach;
	}

	public void setTenLoaiSach(String tenLoaiSach) {
		this.tenLoaiSach = tenLoaiSach;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "maLoaiSach")
	public Set<LoaiSach> getLoaisachs() {
		return loaisachs;
	}

	public void setLoaisachs(Set<LoaiSach> loaisachs) {
		this.loaisachs = loaisachs;
	}
}
