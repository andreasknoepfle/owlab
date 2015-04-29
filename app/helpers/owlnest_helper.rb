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

  def diff_url_for project, id, file_path
    namespace_project_raw_url(project.namespace, project, tree_join(id, file_path))
  end

end
