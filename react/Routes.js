// match.url. A string that returns the matched portion of the URL. This is particularly useful for building nested <Link>s
// match.path. A string that returns the route’s path string — that is, <Route path="">. We’ll be using this to build nested <Route>s.
// match.isExact. A boolean that returns true if the match was exact (without any trailing characters).
// match.params. An object containing key/value pairs from the URL parsed by the Path-to-RegExp package.


import React from 'react';
import { Link, Route } from 'react-router-dom';

const Category = ({ match }) => {
return( <div> <ul>
    <li><Link to={`${match.url}/shoes`}>Shoes</Link></li>
    <li><Link to={`${match.url}/boots`}>Boots</Link></li>
    <li><Link to={`${match.url}/footwear`}>Footwear</Link></li>

  </ul>
  <Route path={`${match.path}/:name`} render= {({match}) =>( <div> <h3> {match.params.name} </h3></div>)}/>
  </div>)
}
export default Category;