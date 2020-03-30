package com.zjft.zhyg.system.dto;

import com.zjft.zhyg.system.pojo.*;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
 * @Author zyq
 * @Description 数据库对象转dto
 **/
@Mapper
public interface DtoMapper {

    DtoMapper MAPPER = Mappers.getMapper(DtoMapper.class);

    /**
     * 将User 转换为UserDto 对象
     *
     * @param user
     * @return
     */
    @Mappings({
            @Mapping(target = "roleNo", source = "role.no"),
            @Mapping(target = "roleName", source = "role.name"),
            @Mapping(target = "orgNo", source = "org.no"),
            @Mapping(target = "orgName", source = "org.name")
    })
    UserDto fromUser(User user);

    /**
     * 将Org 转换为OrgDto 对象
     *
     * @param org
     * @return
     */
    @Mappings({
            @Mapping(target = "orgTypeNo", source = "orgType.no"),
            @Mapping(target = "orgTypeName", source = "orgType.type")
    })
    OrgDto fromOrg(Org org);

    /**
     * 将DevType转换为DevTypeDto对象
     *
     * @param devType
     * @return
     */
    @Mappings({
            @Mapping(target = "catalogNo", source = "devCatalog.no"),
            @Mapping(target = "catalogName", source = "devCatalog.name"),
            @Mapping(target = "vendorNo", source = "devVendor.no"),
            @Mapping(target = "vendorName", source = "devVendor.name")
    })
    DevTypeDto fromDevType(DevType devType);

    /**
     * 将DevBase转换为DevBaseDto对象
     *
     * @param devBase
     * @return
     */
    @Mappings({
            @Mapping(target = "orgNo", source = "org.no"),
            @Mapping(target = "orgName", source = "org.name"),
            @Mapping(target = "catalogNo", source = "devCatalog.no"),
            @Mapping(target = "catalogName", source = "devCatalog.name"),
            @Mapping(target = "vendorNo", source = "devVendor.no"),
            @Mapping(target = "vendorName", source = "devVendor.name"),
            @Mapping(target = "typeNo", source = "devType.no"),
            @Mapping(target = "typeName", source = "devType.name"),
            @Mapping(target = "devService", source = "devServiceCompany.no"),
            @Mapping(target = "devServiceName", source = "devServiceCompany.name")
    })
    DevBaseDto fromDevBase(DevBase devBase);

    /**
     * 将BankManager 转换为BankManagerDto 对象
     *
     * @param bankManager
     * @return
     */
    @Mappings({
            @Mapping(target = "orgNo", source = "org.no"),
            @Mapping(target = "orgName", source = "org.name")
    })
    BankManagerDto fromBankManager(BankManager bankManager);

    /**
     * 将DevServicePerson 转换为DevServicePersonDto 对象
     *
     * @param devServicePerson
     * @return
     */
    @Mappings({
            @Mapping(target = "belongToNo", source = "belongTo.no"),
            @Mapping(target = "belongToName", source = "belongTo.name")
    })
    DevServicePersonDto fromDevServicePerson(DevServicePerson devServicePerson);

    /**
     * 将CaseCatalog 转换为CaseCatalogDto 对象
     *
     * @param caseCatalog
     * @return
     */
    @Mappings({
            @Mapping(target = "orgNo", source = "org.no"),
            @Mapping(target = "orgName", source = "org.name")
    })
    CaseCatalogDto fromCaseCatalog(CaseCatalog caseCatalog);


    /**
     * 将Role 转换为RoleDto 对象
     *
     * @param role
     * @return
     */
    @Mappings({
            @Mapping(target = "orgType", source = "orgType.no"),
            @Mapping(target = "orgTypeName", source = "orgType.type")
    })
    RoleDto fromRole(Role role);

    /**
     * @param
     * @return
     */
    @Mappings({
            @Mapping(target = "applyUserNo", source = "applyUser.no"),
            @Mapping(target = "applyUserName", source = "applyUser.name"),
            @Mapping(target = "applyUserOrgName", source = "applyUser.org.name"),
            @Mapping(target = "applyUsermobile", source = "applyUser.mobile"),
            @Mapping(target = "commitUserNo", source = "commitUser.no"),
            @Mapping(target = "commitUserName", source = "commitUser.name"),
            @Mapping(target = "auditUserNo", source = "auditUser.no"),
            @Mapping(target = "auditUserName", source = "auditUser.name"),
            @Mapping(target = "commitOrgNo", source = "commitOrg.no"),
            @Mapping(target = "commitOrgName", source = "commitOrg.name"),
            @Mapping(target = "commitRoleNo", source = "commitRole.no"),
            @Mapping(target = "commitRoleName", source = "commitRole.name")
    })
    AuditDto fromAudit(Audit audit);

}
