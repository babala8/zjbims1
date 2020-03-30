package com.zjft.zhyg.system.orgtree;

import lombok.Data;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author zyq
 * @Description 机构树排序工具类
 **/
@Data
public class TreeBuilder {
    /**
     * 机构树
     */
    private List<OrgNode> nodes;
    /**
     * 所有机构节点
     */
    private List<OrgNode> allNodes = new ArrayList<>();

    public TreeBuilder(List<OrgNode> nodes) {
        this.nodes = nodes;
    }

    /**
     * 构建JSON 树形结构
     *
     * @return
     */
//    public String buildJSONTree() {
//        List<OrgNode> nodeTree = buildTree();
//        rebuildTree(nodeTree.get(0), 1);
//        return JSON.toJSONString(nodeTree);
//    }

    /**
     * 构建左右子树，left，right
     *
     * @return
     */
//    private int rebuildTree(OrgNode org, int left) {
//        int right = left + 1;
//        if (org.getChildNodes() != null && org.getChildNodes().size() > 0) {
//            for (OrgNode newOrg : org.getChildNodes()) {
//                right = rebuildTree(newOrg, right);
//            }
//        }
//        org.setLeft(left);
//        org.setRight(right);
//        allNodes.add(org);
//        return right + 1;
//    }

    /**
     * 构建树形结构
     *
     * @return
     */
//    private List<OrgNode> buildTree() {
//        List<OrgNode> treeNodes = new ArrayList<>();
//        List<OrgNode> rootNodes = getRootNodes();
//        for (OrgNode rootNode : rootNodes) {
//            rootNode.setTreeLevel(1);
//            buildChildNodes(rootNode);
//            treeNodes.add(rootNode);
//        }
//        return treeNodes;
//    }

    /**
     * 构建树形结构，包含左右序号节点树
     *
     * @return
     */
//    public List<OrgNode> buildTree2() {
//        List<OrgNode> treeNodes = new ArrayList<>();
//        List<OrgNode> rootNodes = getRootNodes();
//        for (OrgNode rootNode : rootNodes) {
//            rootNode.setTreeLevel(1);
//            buildChildNodes(rootNode, 1);
//            treeNodes.add(rootNode);
//        }
//        return treeNodes;
//    }

    /**
     * 构建唯一根节点的树形结构
     */
    public void buildSingleTree() {
        OrgNode root = getRootNode();
        root.setTreeLevel(1);
        buildChildNodes(root, 1);
    }

    /**
     * 递归子节点
     *
     * @param node
     */
//    private void buildChildNodes(OrgNode node) {
//        List<OrgNode> children = getChildNodes(node);
//        if (!children.isEmpty()) {
//            for (OrgNode child : children) {
//                child.setTreeLevel(node.getTreeLevel() + 1);
//                buildChildNodes(child);
//            }
//            node.setChildNodes(children);
//        }
//    }

    /**
     * 递归子节点2 及左右子树
     *
     * @param node
     */
    private int buildChildNodes(OrgNode node, int left) {
        int right = left + 1;
        List<OrgNode> children = nodes.stream().filter(x -> node.getNo().equals(x.getParentOrgNo())).collect(Collectors.toList());
        if (!children.isEmpty()) {
            for (OrgNode child : children) {
                child.setTreeLevel(node.getTreeLevel() + 1);
                right = buildChildNodes(child, right);
            }
            node.setChildNodes(children);
        }
        node.setLeft(left);
        node.setRight(right);
        allNodes.add(node);
        return right + 1;
    }

    /**
     * 获取父节点下所有的子节点
     *
     * @param pnode
     * @return
     */
    private List<OrgNode> getChildNodes(OrgNode pnode) {
        List<OrgNode> childNodes = new ArrayList<>();
        for (OrgNode n : nodes) {
            if (pnode.getNo().equals(n.getParentOrgNo())) {
                childNodes.add(n);
            }
        }
        return childNodes;
    }

    /**
     * 获取指定机构下的所有子机构
     *
     * @param pnode
     * @return
     */
//    public List<OrgNode> getAllSubNodes(OrgNode pnode) {
//        List<OrgNode> subNodeList = new ArrayList<>();
//        int left = pnode.getLeft();
//        int right = pnode.getRight();
//        for (OrgNode node : nodes) {
//            if (node.getLeft() >= left && node.getRight() <= right) {
//                subNodeList.add(node);
//            }
//        }
//        return subNodeList;
//    }

    /**
     * 判断是否为根节点
     *
     * @param node
     * @return
     */
//    private boolean rootNode(OrgNode node) {
//        boolean isRootNode = true;
//        for (OrgNode n : nodes) {
//            if (node.getParentOrgNo() == null || "".equals(node.getParentOrgNo())) {
//                break;
//            }
//            if (node.getParentOrgNo().equals(n.getNo())) {
//                isRootNode = false;
//                break;
//            }
//        }
//        return isRootNode;
//    }

    /**
     * 获取集合中所有的根节点
     *
     * @return
     */
//    private List<OrgNode> getRootNodes() {
//        List<OrgNode> rootNodes = new ArrayList<>();
//        for (OrgNode n : nodes) {
//            if (rootNode(n)) {
//                rootNodes.add(n);
//            }
//        }
//        return rootNodes;
//    }

    /**
     * 获取集合中的唯一根节点
     *
     * @return
     */
    private OrgNode getRootNode() {
        OrgNode root = null;
        for (OrgNode n : nodes) {
            if (StringUtils.isEmpty(n.getParentOrgNo())) {
                root = n;
                break;
            }
        }
        return root;
    }
}
