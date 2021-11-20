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
@Table(name = "TacGia")
public class TacGia {
	private String maTacGia;
	private String tenTacGia;
	
	private Set<TacGia> tacgias = new HashSet<TacGia>(0);
	
	public TacGia() {
		
	}
	
	public TacGia(String maTacGia, String tenTacGia) {
		this.maTacGia = maTacGia;
		this.tenTacGia = tenTacGia;
	}
	
	@Id
	@Column(name = "maTacGia", length = 10)
	public String getMaTacGia() {
		return maTacGia;
	}

	public void setMaTacGia(String maTacGia) {
		this.maTacGia = maTacGia;
	}
	
	@Column(name = "tenTacGia", length = 50, nullable = false)
	public String getTenTacGia() {
		return tenTacGia;
	}

	public void setTenTacGia(String tenTacGia) {
		this.tenTacGia = tenTacGia;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "maTacGia")
	public Set<TacGia> getTacGias() {
		return tacgias;
	}

	public void setTacGias(Set<TacGia> tacgias) {
		this.tacgias = tacgias;
	}
}
