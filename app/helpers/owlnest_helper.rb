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

  def diff_url_for project, id, file_path
    $DOCKER_CONTAINER_IP ? {host: $DOCKER_CONTAINER_IP } : {}
    namespace_project_raw_url(project.namespace, project, tree_join(id, file_path),)
  end

end
