module OwlnestHelper


  def owlnest_action_class action
    case action
    when "added"
      "cgreen"
    when "removed"
      "cred"
    else
      ""
    end
  end

  def owlnest_entity_class type
    map_class = {
      :new_entities => "added",
      :removed_entities => "removed"
    }
    owlnest_action_class(map_class[type])
  end

  def ontology_diff_urls_for project, commit , diff_file
    parent_url = diff_file.new_file ? owlnest_empty_url(owlnest_url_options.merge(format: "owl")) : ontology_diff_url_for(project, commit.parent_id, diff_file.old_path)
    child_url = diff_file.deleted_file ? owlnest_empty_url(owlnest_url_options.merge(format: "owl")) : ontology_diff_url_for(project, commit.id, diff_file.new_path)
    {
      child: child_url,
      parent: parent_url
    }
  end

  def ontology_diff_url_for project, id, file_path

    namespace_project_raw_url(project.namespace, project, tree_join(id, file_path), owlnest_url_options)
  end

  def owlnest_url_options
    $DOCKER_CONTAINER_IP ? {host: $DOCKER_CONTAINER_IP } : {}
  end

end
