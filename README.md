# godot-copy-transform
Copy and paste a Spatial node's position and rotation to another node.

Adds two new Tool menu items:

- **Project->Tools->Copy Transform**
  - Copies the currently selected Transform matrix from a Spatial node.
  
- **Project->Tools->Paste Transform**
  - Pastes a previously copied Transform matrix to one or more Spatial nodes.

*Note:* This copies and pastes the transform **only** (position and rotation), not the nodes.  Good for getting two or more things to line up precisely.
