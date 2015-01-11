package com.app.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 
 * APPµÄTAGS
 * 
 * 2015-1-10
 *
 */
@Entity
@Table(name = "AM_TAG")
public class Tag {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private long id;
	
	//tagµÄÃû×Ö
	@Column(name="name", unique = true, nullable = false)
	private String name;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinTable(name = "AM_TAG_APP_XREF", joinColumns = { @JoinColumn(name = "TAG_ID") }, inverseJoinColumns = { @JoinColumn(name = "APP_ID") })
	private Set<App> apps = new HashSet<App>(0); 
	
	@Column(name="deleted", columnDefinition="BOOLEAN default false")
    private boolean deleted;
	
	public Tag() {
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<App> getApps() {
		return apps;
	}

	public void setApps(Set<App> apps) {
		this.apps = apps;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	
}
