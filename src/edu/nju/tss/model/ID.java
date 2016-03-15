package edu.nju.tss.model;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * 使用UUID生成每个表的ID
 * @author cylong
 * @version 2016年3月16日 上午12:37:01
 */
@MappedSuperclass
public class ID implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = -869454400573942076L;
	@Id
	protected String id;

	public ID() {
		this.id = UUID.randomUUID().toString();
	}

	@Column(name = "id", columnDefinition = "CHAR(32)")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (obj.getClass() != this.getClass())
			return false;

		User another = (User)obj;
		return this.id.equals(another.id);
	}

	@Override
	public int hashCode() {
		return this.id.hashCode();
	}

}
