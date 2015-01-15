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

import com.app.util.FileOperateUtil;

/**
 * 
 * 2015-1-10
 *
 */
@Entity
@Table(name = "AM_APP")
public class App {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private long id;
    
    //display name 是在前台显示用的名字 例如 微信，微博
    @Column(name="displayname")
    private String displayname;
    
    //filename是后台路径中真正存储的name 例如 weixin_1898.apk
    @Column(name="filename", unique = true, nullable = false)
    private String filename;
    
    //app的版本号 例如1.8.9.8
    @Column(name="version")
    private String version;
    
    @Column(name="shortdesc")
    private String shortDesc;
    
    @Column(name="longdesc")
    private String longDesc;
    
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinTable(name = "AM_CAT_APP_XREF", joinColumns = { @JoinColumn(name = "APP_ID") }, inverseJoinColumns = { @JoinColumn(name = "CAT_ID") })
    private Set<Category> cats = new HashSet<Category>(0);
    
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinTable(name = "AM_TAG_APP_XREF", joinColumns = { @JoinColumn(name = "APP_ID") }, inverseJoinColumns = { @JoinColumn(name = "TAG_ID") })
    private Set<Tag> tags = new HashSet<Tag>(0);
    
    @Column(name="deleted", columnDefinition="BOOLEAN default false")
    private boolean deleted;
    
    @Column(name="iconpath")
    private String iconPath;
    
    @Column(name="filesize")
    private String fileSize;
    
    public App() {
        
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public Set<Category> getCats() {
        return cats;
    }

    public void setCats(Set<Category> cats) {
        this.cats = cats;
    }

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public String getLongDesc() {
        return longDesc;
    }

    public void setLongDesc(String longDesc) {
        this.longDesc = longDesc;
    }

    public String getIconPath() {
        return iconPath;
    }

    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }
    
}
