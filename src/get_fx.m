function A=get_fx(h, w)
  % to calculate first  order constraint in horizontal direction
  all_ids = reshape([1:h*w], [h w]);

  self_ids=all_ids;
  negh_ids=circshift(all_ids, [0 -1]);
  ind=ones(h,w);
  ind2=ind;
  ind2(:,end)=0; %Ignore the last column
  S_plus=sparse(self_ids(:), self_ids(:), ind);
  S_minus=sparse(self_ids(:), negh_ids(:), ind2);
  A=S_plus-S_minus;


